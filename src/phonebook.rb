class PhoneBook
    
    #Entries are stored in @entries.
    #Each entry is an array with three values
      #index 0: name of the entry
      #index 1: stored number of the entry
      #index 2: true if listed, false if not


    def initialize
      @entries = []   #Array to store entries (which are arrays of 3)
      @names_by_ac = {}   #Hash to store names by area code while adding entries (to improve efficiency)
    end


    #Add an entry
    def add(name, number, is_listed)
      
      #checks to see if the person already exists and if the number is not listed 
      @entries.each do |entry|
        if name == entry[0]
          return false  #returns false because name exists
        end
        if number == entry[1]
          if entry[2]
            return false  #returns false because number is already listed
          end
        end
      end

      #Using regex to check for correct format
      format_check = number =~ /\A(\d{3})-\d{3}-\d{4}\z/  #grouped area code into $1
      if format_check == nil
        return false  #returns false because number format is incorrect
      end

      area_code = $1.to_i   #converting to int for less memory consumption
      
      #All tests pasts, adding entry
      @entries << [name, number, is_listed]

      if !@names_by_ac.has_key?(area_code)  #Initializing new array if key doesn't exist yet
          @names_by_ac[area_code] = []
      end

      @names_by_ac[area_code] << name  #converted area code to integer for less memory use

      return true
    end
    

    #Find an entry by name, return its number if listed
    def lookup(name)
        
      #Loop through entries looking for name match
      @entries.each do |entry|
        if name == entry[0]
          #Check if entry is listed
          if entry[2]
            return entry[1]   #returns number
          else
            return nil  #no alike names, so no reason to iterate through rest of the array
          end
        end
      end

      return nil #no matching name found
    end

    
    #Find an entry by number, return its name if listed
    def lookupByNum(number)

      #Loop through entries, looking for number match
      @entries.each do |entry|
        if number == entry[1]
          #check if entry is listed
          if entry[2]
            return entry[0]   #returns name
          end
        end  
      end
      
      return nil #no matching number found thats listed
    end


    #Return all the names matching an area code
    def namesByAc(areacode)
      
      areacode = areacode.to_i  #converting to int to match initial entry

      if @names_by_ac[areacode] == nil
        return []   #so namesByAc() doesn't return nil
      end

      return @names_by_ac[areacode]

    end
end
