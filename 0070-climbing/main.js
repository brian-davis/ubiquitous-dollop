// def climb_stairs_fast_fib2(n)
//   fibs = [1, 1]

//   0.upto(n) do |i|
//     fibs[i] ||= fibs[i - 1] + fibs[i - 2]
//   end

//   fibs[n]
// end


var climbStairs = function(n) {
  let fibs = [1, 1];
  for (i = 0; i <= n; i++) {
    fibs[i] ||= fibs[i - 1] + fibs[i - 2];
  }
  return fibs[n];
};

for (e = 1; e <=10; e++) {
  console.log(`climbStairs(${e})`, climbStairs(e))
}