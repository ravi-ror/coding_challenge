# Euclidean algorithm

# The Euclidean algorithm provides an efficient approach to solve for the HCF or the GCD of the given numbers.
# The main fact to be considered here is that the HCF of two numbers does not modify if the smaller number is subtracted from the
# larger number.

# Euclidean algorithm
def gcd(a, b)
  return b if (a == 0)
  return a if (b == 0)
  return a if (a == b)

  if (a > b)
    return gcd(a-b, b)
  end

  gcd(a, b-a);
end


a = 98
b = 14

puts "GCD: #{gcd(a, b)}"


# OR

# def gcd(a, b)
#   if a % b == 0
#     b
#   else
#     gcd(b, a % b)
#   end
# end


# def gcd(x, y) {
#   while(y) {
#     t = y;
#     y = x % y;
#     x = t;
#   }
#   return x;
# }

# // looping from 1 to number1 and number2
# for (let i = 1; i <= number1 && i <= number2; i++) {

#     // check if is factor of both integers
#     if( number1 % i == 0 && number2 % i == 0) {
#         hcf = i;
#     }
# }


# while(number1 != number2){
#     if(number1 > number2) {
#         number1 -= number2;
#     }
#     else {
#         number2 -= number1;
#     }
# }

