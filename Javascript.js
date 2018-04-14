// https://repl.it/@CranberryYam/CruelFaithfulBrains

print(getOnes(28)); // 28 is 11100

function getOnes(num) {
    var quotient = Math.floor(num/2);
    var remainder = num % 2;
    
    if (quotient == 0) {
        return 1;
    }
    return getOnes(quotient)+remainder;
}