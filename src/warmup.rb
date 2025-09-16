def fib(n)
    fib = []
    
    #Special case: returns an empty array if n = 0
    if n == 0
      return fib
    end 
    
    #Iterates from 1..n, constructs fib array
    (1..n).each do |i|
      #Special case: for 1 & 2, there aren't two previous array entries to add together
      if i == 1 || i == 2
        fib << i - 1        #i - 1 works for both of these; fib(1) = 0 & fib(2) = 1
      else    #i > 2
        fib_prev1 = fib[i - 3]  #i - 3 because i is 3 ints away from index of 2nd most recent number
        fib_prev2 = fib[i - 2]  #i - 2 because i is 2 ints away from index of most recent number
        fib << fib_prev1 + fib_prev2  
      end
    end
    
    #Returns fully completed fibonacci array
    return fib
end


def isPalindrome(n)
  #No negative case - assuming n is non-negative
  
  reverse = 0
  n_copy = n  #making a copy of n

  while n != 0  #using modulus and division to construct a reverse of n
    remainder = n % 10
    n /= 10
    reverse *= 10
    reverse += remainder
  end
  
  #Checking if constructed reverse is = to initial val of n
  if reverse == n_copy
    return true
  else
    return false
  end
end


#Using ruby's built in .sort() method, as it's more efficient than any method I could easily write myself
def nthmax(n, a)
  #No extra cases to account for

  sorted_a = a.sort
  a_len = a.length
  
  #Checking if n is larger than the amount of elements in a
  if n > a_len
    return nil
  end

  #Array is sorted in reverse order, need to get correct index to return
  index = (a_len - 1) - n   #Subtracts n from the last element of the array. (Inputting 0 would return largest element)
  return sorted_a[index]
end

def freq(s)
    raise Exception, "Not Implemented"
end

def zipHash(arr1, arr2)
    raise Exception, "Not Implemented"
end

def hashToArray(hash)
    raise Exception, "Not Implemented"
end
