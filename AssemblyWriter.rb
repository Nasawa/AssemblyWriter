tVars = ["t0","t1","t2","t3","t4","t5","t6","t7","t8","t9"]
content = Array.new
definer = Array.new
sPrinter = Array.new
iPrinter = Array.new
vars    = Array.new
output  = Array.new
loop    = Array.new
add     = Array.new
sub     = Array.new
mult    = Array.new
div     = Array.new
goeq      = Array.new
golt      = Array.new
gogt      = Array.new
v = 0
v2 = 0
de = 0
ps = 0
pi = 0
o = 0
l = 0
a = 0
a2= 0
s = 0
s2= 0
m = 0
m2= 0
d = 0
d2= 0
eq = 0
eq2 = 0
lt = 0
lt2 = 0
gt = 0
gt2 = 0
File.open("prompt.txt", "r") do |reader|
  content = reader.sysread(reader.size)
end

content = content.split(';')

(0..content.length - 1).each do |i|

  if content[i].include? "DEFINE("
    definer[d] = content[i].delete("()").chomp("\r\n").split('DEFINE')[1]
  de = de + 1

  else
    if content[i].include? "PRINTS("
      sPrinter[ps] = content[i].delete("()").chomp("\r\n").split('PRINTS')[1]
      output[o] = sPrinter[ps] + "PRINTSTR"
    ps = ps + 1
    end

    if content[i].include? "PRINTI("
      iPrinter[pi] = content[i].delete("()").chomp("\r\n").split('PRINTI')[1]
      output[o] = iPrinter[pi] + "PRINTINT"
    pi = pi + 1
    end

    if content[i].include? "VAR("
      vars[v] = content[i].delete("()").chomp("\r\n").split('VAR')[1]
      output[o] = vars[v] + "VARME"
    v = v + 1
    end

    if content[i].include? "LOOP("
      loop[l] = content[i].delete("()").chomp("\r\n").split('LOOP')[1]
      output[o] = loop[l] + "LOOPME"
    end

    if content[i].include? "ADD("
      add[a] = content[i].delete("()").chomp("\r\n").split('ADD')[1]
      output[o] = add[a] + "ADDME"
      a = a + 1
    end

    if content[i].include? "SUB("
      sub[s] = content[i].delete("()").chomp("\r\n").split('SUB')[1]
      output[o] = sub[s] + "SUBME"
      s = s + 1
    end

    if content[i].include? "MULT("
      mult[m] = content[i].delete("()").chomp("\r\n").split('MULT')[1]
      output[o] = mult[m] + "MULTME"
      m = m + 1
    end

    if content[i].include? "DIV("
      div[d] = content[i].delete("()").chomp("\r\n").split('DIV')[1]
      output[o] = div[d] + "DIVME"
      d = d + 1
    end

    if content[i].include? "GOIFEQ("
      goeq[eq] = content[i].delete("()").chomp("\r\n").split('GOIFEQ')[1]
      output[o] = goeq[eq] + "GOIFEQ"
      eq = eq + 1
    end

    if content[i].include? "GOIFLT("
      golt[lt] = content[i].delete("()").chomp("\r\n").split('GOIFLT')[1]
      output[o] = golt[lt] + "GOIFLT"
      lt = lt + 1
    end

    if content[i].include? "GOIFGT("
      gogt[gt] = content[i].delete("()").chomp("\r\n").split('GOIFGT')[1]
      output[o] = gogt[gt] + "GOIFGT"
      gt = gt + 1
    end
  o = o + 1
  end#if
end#for
File.open("tester.txt", "w") do |writer|
  writer.puts ".data"
  (0..definer.length - 1).each do |i|
    temp = definer[i].split(',')
    writer.puts "#{temp[0]}: .asciiz #{temp[1].strip()}"
  end

  writer.puts".globl main\n.text"

  (0..output.length - 1).each do |i|
    if output[i].include? "PRINTSTR"
      writer.puts "li  $v0, 4\nla  $a0, #{output[i].chomp("PRINTSTR")}\nsyscall"
    end
    if output[i].include? "PRINTINT"
      (0..vars.length - 1).each do |j|
        if vars[j].include? output[i].chomp("PRINTINT")
          writer.puts "move $a0, $#{tVars[j]}\nli  $v0, 1\nsyscall"
        end
      end
    end

    if output[i].include? "VARME"
      temp = vars[v2].split(',')
      writer.puts "li $#{tVars[v2]}, #{temp[1].strip().chomp("VARME")}"
    v2 = v2 + 1
    end

    if output[i].include? "ADDME"
      temp = add[a2].split(',')
      (0..vars.length - 1).each do |j|
        if vars[j].include? temp[0]
          writer.puts "addi $#{tVars[j]}, $#{tVars[j]}, #{temp[1].strip()}"
        end
      end
    a2 = a2 + 1
    end
    
    if output[i].include? "SUBME"
      temp = sub[s2].split(',')
      (0..vars.length - 1).each do |j|
        if vars[j].include? temp[0]
          writer.puts "subi $#{tVars[j]}, $#{tVars[j]}, #{temp[1].strip()}"
        end
      end
    s2 = s2 + 1
    end
    
    if output[i].include? "MULTME"
      temp = mult[m2].split(',')
      (0..vars.length - 1).each do |j|
        if vars[j].include? temp[0]
          writer.puts "multi $#{tVars[j]}, $#{tVars[j]}, #{temp[1].strip()}"
        end
      end
    m2 = m2 + 1
    end
    
    if output[i].include? "DIVME"
      temp = div[d2].split(',')
      (0..vars.length - 1).each do |j|
        if vars[j].include? temp[0]
          writer.puts "divi $#{tVars[j]}, $#{tVars[j]}, #{temp[1].strip()}"
        end
      end
    d2 = d2 + 1
    end

    if output[i].include? "LOOPME"
      writer.puts "#{output[i].chomp("LOOPME")}:"
    end
    
    if output[i].include? "GOIFEQ"
      temp = goeq[eq2].chomp("GOIFEQ").split(', ')
      (0..vars.length - 1).each do |j|
        if vars[j].include? temp[1]
          writer.puts "beq $#{tVars[j]}, #{temp[2]}, #{temp[0]}"
        end
      end
      eq2 = eq2 + 1
    end
    
    if output[i].include? "GOIFLT"
      temp = golt[lt2].chomp("GOIFLT").split(', ')
      (0..vars.length - 1).each do |j|
        if vars[j].include? temp[1]
          writer.puts "blt $#{tVars[j]}, #{temp[2]}, #{temp[0]}"
        end
      end
      lt2 = lt2 + 1
    end


    if output[i].include? "GOIFGT"
      temp = gogt[gt2].chomp("GOIFGT").split(', ')
      (0..vars.length - 1).each do |j|
        if vars[j].include? temp[1]
          writer.puts "bgt $#{tVars[j]}, #{temp[2]}, #{temp[0]}"
        end
      end
      gt2 = gt2 + 1
    end


  end#for output
  writer.puts "li $v0, 10\nsyscall"
end