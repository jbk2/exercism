# require 'pry'

GIFTS = ["twelve Drummers Drumming", "eleven Pipers Piping", "ten Lords-a-Leaping", "nine Ladies Dancing", "eight Maids-a-Milking", "seven Swans-a-Swimming", "six Geese-a-Laying", "five Gold Rings", "four Calling Birds", "three French Hens", "two Turtle Doves", "and a Partridge in a Pear Tree"]
# HUMAN_NUMS = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve"]
HUMAN_ORDINALS = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]
INTRO_TEXT = 'On the %s day of Christmas my true love gave to me:'


class TwelveDaysTest  
  def self.song
    whole_song = ""
    
    1.upto(12) do |day|
      sentence = ""
      ordinal = HUMAN_ORDINALS[day - 1]
      gifts = GIFTS.slice(-day, day)
      gifts[0] = gifts[0].sub('and ', '') if day == 1
      intro = INTRO_TEXT % ordinal
      
      sentence << intro
      newline = day == 12 ? "\n" : "\n\n"
      sentence << " " + gifts.join(', ') + "." + newline
      whole_song << sentence
    end
    
    whole_song
  end
end