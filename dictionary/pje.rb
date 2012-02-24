#!/usr/local/bin/macruby
# coding: utf-8
# -*- ruby -*-

require 'rubygems'
require 'optparse'
require 'shellwords'
require 'readline'
require 'thread'
require 'paint'
load_bridge_support_file File.dirname(__FILE__) + '/DictionaryServices.bridgesupport'



def mainloop()
  opts = OptionParser.new
  opts.version = '0.1'
  opts.program_name = 'Dic'
  opts.banner = 
    "#{opts.program_name}, version #{opts.version}\n" +
    "\n" +
    "Usage: #{opts.program_name} [-dh] [filename]"

  opts.on('-h', '--help','Show this message.'){
    puts opts
    exit
  }

  ip =Sys::Interpreter.new(opts.version, opts.program_name)
  ip.on_tail('Japanese-Englesh','-je',['SPELL'],
          "プログレッシプ英和・和英中辞典."){ |spell|
    if spell == ""
      puts "no spell"
      next
    end

    unless result = dictionary('プログレッシブ英和・和英中辞典',spell)
      puts "not such word: #{spell}\n"
      next
    end

   print "*** " + Paint[spell, :red, :bold] + " ***\n"

    result.split(/\n/).each_with_index do |line,i|
      if i == 0
        print " " + Paint[line, :blue, :underline] + "\n" 
      elsif line =~ /^━━/
        puts ""
        while line.match(/(間投詞|名　詞|動　詞|自動詞|他動詞|接続詞|代名詞)/)
          print " " + Paint[$1, :blue, :underline] + " "
          line.sub!(/#{$1}/, "")
        end
        puts ""
        line.gsub!(/•|━━/,"")
        print " •" + line + "\n" unless line == ""
      elsif line =~ /^.[.]/
        print "\n " + Paint[line, :yellow, :bold] + "\n"
      elsif line =~ /^[\d]+/
        print " " + line + "\n"
      else
        print "   " + line + "\n"
      end

    end

    puts "\n"
    
  }
  ip.on_tail('Dictionary','-d',['SPELL'],
             "New Oxford American Dictionary."){ |spell|
    unless spell
      puts "no spell"
      next
    end

    unless result = dictionary('New Oxford American Dictionary',spell)
      puts "not such word: #{spell}\n"
      next
    end


    print "*** " + Paint[spell, :red, :bold] + " ***\n"

    result.split(/\n/).each_with_index do |line,i|

      if i == 0
        print " " + Paint[line, :blue, :underline] + "\n" 
      elsif line.match(/^(interrogative\sadverb|relative\sadverb|conjunction|noun|exclamation|verb|adverb)\s$/)
        print "\n " + Paint[$1, :blue, :underline] + "\n"
      elsif line =~ /^(DERIVATIVES)/
        print "\n " + Paint[$1, :yellow, :bold] + "\n"
      elsif line =~ /^[\d]+/
        print " " + line + "\n"
      else
        print "   " + line + "\n"
      end

    end

    puts "\n"


  }
  ip.on_tail('Thesaurus','-t',['SPELL'],
             "Oxford American Writer's Thesaurus."){ |spell|
    unless spell
      puts "no spell"
      next
    end

    unless result = dictionary('Oxford American Writer\'s Thesaurus',spell)
      puts "not such word: #{spell}\n"
      next
    end

    print "*** " + Paint[spell, :red, :bold] + " ***\n"

    result.split(/\n/).each_with_index do |line,i|

      if i == 0
        print " " + Paint[line, :blue, :underline] + "\n" 
      elsif line.match(/^(interrogative\sadverb|relative\sadverb|conjunction|noun|exclamation|verb|adverb)\s$/)
        print "\n " + Paint[$1, :blue, :underline] + "\n"
      elsif line =~ /^(DERIVATIVES)/
        print "\n " + Paint[$1, :yellow, :bold] + "\n"
      elsif line =~ /^[\d]+/
        print " " + line + "\n"
      else
        print "   " + line + "\n"
      end

    end

    puts "\n"
  }
  ip.on_tail('LSDT','-lt',['SPELL'],
             "LSD Thesaurus."){ |spell|
    next unless result = dictionary('LSD Thesaurus',spell)
    puts result
  }
  ip.on_tail('LSD','-l',['SPELL'],
             "LSD."){ |spell|
    next unless result = dictionary('LSD',spell)
    puts result
  }
  ip.on_tail('say','s',['SPELL'],
             "say spel"){ |spell|
    `say #{spell}`
  }
  ip.on_tail('help', 'h', ['COMMAND'],
             'Show help. If you specify COMMAND, only the help about the command is shown.') { |cmd|
    if (cmd.empty?)
      puts ip
    else
      puts ip.command(cmd).to_s
    end
  }
  ip.on_tail('quit','p', [], 'Quit dictonary'){
    ip.stop
  }

  srand
  ip.drive
end
    
# select dictionary at dicname 
def dictionary(dicname,word)
  dict = nil

  dict = DCSCopyAvailableDictionaries().allObjects.find { |i|
    DCSDictionaryGetName(i) == dicname
  }

  range = DCSGetTermRangeInString(nil, word, 0)
  
  if range.location != -1 && range.length == word.size
    return DCSCopyTextDefinition(dict, word, range)
  else
    return false
  end
end

module Sys
  class Interpreter
    def initialize(version = '0.0', program_name = nil)
      @version = version
      @program_name = (program_name) ? program_name : File::basename($PROGRAM_NAME)
      @commands = Array.new
      @words = Array.new
      @sys = nil
      @drive_flag = false
    end

    attr_reader :sys
    attr_reader :version
    attr_reader :program_name

    def on_tail(*args, &p)
      @commands.push(Command.new(*args, &p))
      @words.push(@commands[-1].long)
      @words.push(@commands[-1].short)
    end

    def command(command_name)
      @commands.each do |cmd|      
        return cmd if (command_name == cmd.long or command_name == cmd.short)
      end
      nil
    end

    def to_s
      str = "#{@program_name}, version #{@version} --- Command List\n"
      @commands.each do |cmd|
        str += cmd.to_s + "\n"
      end
      str
    end

    def drive
      Readline::basic_word_break_characters = "\t\n\"\'\ "
      Readline::completion_proc = Proc.new { |iword|
        candidate = Array.new
        @words.each do |word|
          candidate.push(word) if (/\A#{Regexp::quote(iword)}/ =~ word)
        end
        candidate
      }

      # This is just fun and games.

      puts "\n" +
        "#{@program_name}, version #{@version}\n" +
        "Type `help` or `h` for help."
      @drive_flag = true
      while (@drive_flag)
        input = Shellwords::shellwords(Readline::readline("#{@program_name}> ", true))
        next if (input.empty?)
        icmd = input.shift
        valid_cmd_flag = false
        @commands.each do |cmd|
          if (cmd.long == icmd or cmd.short == icmd)
            begin
              cmd.exec(*input)
            rescue CommandError
              puts "#{$!.class.to_s.split("::").last}: #{$!}"
            end
            valid_cmd_flag = true
            break
          end
        end
        puts "Error: \"#{icmd}\" is unknown command." unless (valid_cmd_flag)
      end

      puts "\nGoodbye...\n "
    end

    def stop
      @drive_flag = false
    end
  end



  class Command
    def initialize(long, short, args, desc = 'I don\'t know.', &p)
      raise ArgumentError, 'The first argument must be String.' unless (String === long)
      raise ArgumentError, 'The second argument must be String.' unless (String === short)
      raise ArgumentError, 'The third argument must be Array.' unless (Array === args)
      raise ArgumentError, 'The forth argument must be String.' unless (String === desc)
      raise ArgumentError, 'The last argument must be Proc.' unless (Proc === p)

      long = long.strip
      raise ArgumentError, "#{long} is terrible command." if (long.empty?)
      @long = long # long command

      short = short.strip
      raise ArgumentError, "#{short} is terrible command." if (short.empty?)
      @short = short # short command

      @args = Array.new(args.size) # arguments
      @def_args = Array.new(args.size) # default arguments
      @min_num_args = @args.size # the minimum number of arguments

      def_args_flag = false
      for i in 0...args.size do
        arg = args[i].strip
        if (/^(\w+)$/ =~ arg)
          if (def_args_flag)
            raise ArgumentError, 'Default arguments is invalid.'
          else
            @args[i] = Regexp::last_match(1)
          end
        else
          raise ArgumentError, 'Can not using characters except alphabets, numbers and underbar for the argument name.'
        end
      end

      @desc = desc.strip # command's description
      @p = p # command's process
    end

    attr_reader :long
    attr_reader :short

    def to_s(show_desc_flag = true, tab_lv = 4, line_length = 76)
      str =
        str = ' ' * tab_lv + @short.to_s
      str += ', ' + @long.to_s
      for i in 0...@args.size do
        str += ' ' + @args[i]
        str += '=' + @def_args[i] if (@def_args[i])
      end

      if (show_desc_flag)
        line_length -= tab_lv * 2
        desc_lines = @desc.split(/\n/)
        desc_lines.each do |dl|
          if (dl.size > line_length)
            dl_len = dl.size
            num_dl_line = 1
            while (dl_len > 0)
              str += 
                "\n" + ' ' * (tab_lv * 2) +
                dl[(line_length * (num_dl_line - 1))...(line_length * num_dl_line)]
              dl_len -= line_length
              num_dl_line += 1
            end
          else
            str += "\n" + ' ' * (tab_lv * 2) + dl
          end
        end
      end

      str
    end
   

    def exec(*args)
      tmp = args.join " "
      @p.call(tmp)
    end


  end
end

mainloop()



