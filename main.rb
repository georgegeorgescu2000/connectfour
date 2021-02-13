class String
    def black;          "\e[30m#{self}\e[0m" end
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def brown;          "\e[33m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    def gray;           "\e[37m#{self}\e[0m" end
    
    def bg_black;       "\e[40m#{self}\e[0m" end
    def bg_red;         "\e[41m#{self}\e[0m" end
    def bg_green;       "\e[42m#{self}\e[0m" end
    def bg_brown;       "\e[43m#{self}\e[0m" end
    def bg_blue;        "\e[44m#{self}\e[0m" end
    def bg_magenta;     "\e[45m#{self}\e[0m" end
    def bg_cyan;        "\e[46m#{self}\e[0m" end
    def bg_gray;        "\e[47m#{self}\e[0m" end
    
    def bold;           "\e[1m#{self}\e[22m" end
    def italic;         "\e[3m#{self}\e[23m" end
    def underline;      "\e[4m#{self}\e[24m" end
    def blink;          "\e[5m#{self}\e[25m" end
    def reverse_color;  "\e[7m#{self}\e[27m" end
 end

TABLE1 = [[10,11,12,13,14,15,16],[20,21,22,23,24,25,26],[30,31,32,33,34,35,36],[40,41,42,43,44,45,46],[50,51,52,53,54,55,56],[60,61,62,63,64,65,66],[70,71,72,73,74,75,76]]


class Showtable
   
    
    def showmoves(player,column)
        
        if player == 1
            playerprint = " \u25c9"
        elsif player == 2
            playerprint = "\u26ab ".red
        end
        i = 0
        while i < 7 
            if TABLE1[i][column].to_s > " \u25c9".to_s 
                TABLE1[i][column] = playerprint
               
               # puts
               # TABLE1.reverse.map! do |col| 
               #     puts "|" + col.join("|") 
               # end
              #  print "--1--2--3--4--5--6--7"
                puts
                
                g = Gameover.new(i,column,playerprint)
               
                g.verification
                
                i = 7
            end
            i += 1
        end
        
        
        
    end

end



class Game
    
    def playermove(player,column) 
        pr = Showtable.new
      pr.showmoves(player,column)
    end
    
end

class Gameover

    def initialize (raw,column,player)
        @raw = raw
        @column = column
        @player = player
    end
    
  
    def verification
       
        h = Array.new(0)       
        numberfour = 0
       
            for i in (0..@raw)
                vertical = h.push(TABLE1[i][@column])
                
            end
            
            for i in (0..vertical.length-1)
                if vertical[i] == @player
                   numberfour += 1 
                else
                    numberfour = 0
                  
                        
                end
            end

            if numberfour >= 4
               
                puts "Game win by #{@player}"
                puts "Game over"
                exit
            end
    
        g = Array.new(0)       
        numberfour = 0
        
            for i in (0..@column)
                orizontal = g.push(TABLE1[@raw][i])
                
            end
            
            for i in (0..orizontal.length-1)
                if orizontal[i] == @player
                    numberfour += 1 
                else
                    numberfour = 0            
                end
            end

            if numberfour >= 4
                puts "Game win by #{@player}"
                puts "Game over"
                exit
            end
      
        d = Array.new(0)      
        dsec =  Array.new(0)
        numberfour = 0 
           
            if @column.to_i == @raw.to_i
                
                for i in (0..6)                    
                    diagonal = d.push(TABLE1[i][i])      
                              
                end

                
                if @raw+@column < 7

                    for i in (0..@column+@raw)
                    diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                    end
                else
                    for i in (@raw*2 - 6..6)
                        diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                    end

                end
               
                #p diagonal
                #p diagonalsec
          
            elsif @column.to_i < @raw.to_i
                row_go = @raw.to_i - @column.to_i
                column_go = 0
                for i in (column_go..6-row_go)                    
                    diagonal = d.push(TABLE1[i+row_go][i])                                        
                end
                
                if @column == 0
                    for i in (0..@raw)                    
                        diagonalsec= dsec.push(TABLE1[@raw-i][i])                                        
                    end
                elsif @column <= 1 && @raw < 6
                    for i in (0..@raw+1)                    
                        diagonalsec= dsec.push(TABLE1[@raw-i+1][i])                                        
                    end
                elsif @column + @raw == 7 && @column == 1
                    for i in (@column..@raw)                    
                        diagonalsec= dsec.push(TABLE1[@raw-i+1][i])                                        
                    end
                elsif @column + @raw == 5 || @column + @raw == 6
                    for i in (0..@raw+@column)                    
                        diagonalsec= dsec.push(TABLE1[@raw-i+2][i])                                        
                    end
                elsif @column + @raw >= 7 && @column == 2 && @raw < 6
                    for i in (@column-1..@raw+1)                    
                        diagonalsec= dsec.push(TABLE1[@raw-i+2][i])                                        
                    end
                elsif @column + @raw >= 7 && @column == 2 && @raw == 6
                    for i in (@column..@raw)                    
                        diagonalsec= dsec.push(TABLE1[@raw-i+2][i])                                        
                    end
                elsif @column + @raw == 6 && @column == 3 
                    for i in (@raw - @column..6)                    
                        diagonalsec= dsec.push(TABLE1[6-i+2][i])                                        
                    end
                elsif @column ==3 && @raw >= 7 - @column
                    for i in (@raw - @column..6)                    
                       diagonalsec= dsec.push(TABLE1[@raw + 3-i][i])                                        
                    end
                elsif @column ==4 && @raw >= 6 - @column
                    for i in (@raw - @column..4)                    
                       diagonalsec= dsec.push(TABLE1[@raw+2-i][i+2])                                        
                    end
                elsif @column ==5 && @raw == 6
                    for i in (@raw - @column+1..3)                    
                       diagonalsec= dsec.push(TABLE1[@raw+2-i][i+3])                                        
                    end
               
               
                end


                #p diagonal
                #p diagonalsec
            elsif @column.to_i > @raw.to_i
                
                row_go = @raw.to_i
                column_go = @column.to_i - @raw.to_i
                
                for i in (0..6-column_go+@row.to_i)
                    diagonal = d.push(TABLE1[i][i+column_go])                                        
                end

                if @raw+@column < 7

                    for i in (0..@column+@raw)
                    diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                    end
                elsif @raw+@column == 7
                   if @column <= 4
                        for i in (@column-@raw ..6)
                            diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                        end
                    elsif @column == 6 && @raw == 1

                        for i in (1 ..6)
                            diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                        end
                    else
                        for i in (@column-@raw-2 ..6)
                            diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                        end
                    end
                elsif @column ==5 && @raw == 4
                    for i in (@raw - @column+1..3)                    
                       diagonalsec= dsec.push(TABLE1[@raw+2-i][i+3])                                        
                    end
                elsif @column ==5 && @raw == 5
                    for i in (@raw - @column+1..3)                    
                       diagonalsec= dsec.push(TABLE1[@raw+2-i][i+3])                                        
                    end
                elsif @column ==6 && @raw == 4
                    for i in (@column-@raw+2..6)                    
                       diagonalsec= dsec.push(TABLE1[@raw+6-i][i])                                        
                    end
                elsif @column ==6 && @raw == 5
                    for i in (@column-@raw+4..6)                    
                       diagonalsec= dsec.push(TABLE1[@raw+6-i][i])                                        
                    end
               

                
                else
                    if @column == 6 && @raw == 2
                        for i in (2..6)
                            diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                            end

                    else
                        for i in (@column-@raw..6)
                        diagonalsec = dsec.push(TABLE1[@raw-i+@column][i])   
                        end
                    end
                end
                
                ##p diagonal
                #p diagonalsec
            end

            

            
            for i in (0..diagonal.length-1)
                if diagonal[i] == @player
                    numberfour += 1 
                else
                    numberfour = 0            
                end
            end

            if numberfour >= 4
                puts "Game win #{@player}"
                puts "Game over"
                exit
            end
          
    end

    def verifiwin
        i = 1

        i
    end
end




   
   news = Game.new
   news.playermove(0, 9)
   
   cl = Gameover.new(0,0,0)
   while cl.verifiwin == 1
      puts
                  TABLE1.reverse.map! do |col| 
                      puts "|" + col.join("|") 
                end
                  print "--1--2--3--4--5--6--7"
                  puts

      puts " player 1 Choose column where you puts "
      
      player = 1
      move1 = gets.chomp

      while move1.to_i < 1 || move1.to_i > 7
        puts "Choose another number because is wrong"
        move1 = gets.chomp
      end

      news.playermove(player,move1.to_i-1)

      puts
      TABLE1.reverse.map! do |col| 
          puts "|" + col.join("|") 
      end
      print "--1--2--3--4--5--6--7"
      puts
      
      puts " Player 2 Choose column where you puts "
      player = 2
      move2 = gets.chomp
      while move2.to_i < 1 || move2.to_i > 7
        puts "Choose another number because is wrong"
        move2 = gets.chomp
      end
      news.playermove(player,move2.to_i-1)
    end
  
    
