function longestCommonPrefix(strs) {
  var compareStr =  strs.sort((a, b) => a.length - b.length)[0];
  for (var i = compareStr.length; i > 0; i--) {
    compareStr = compareStr.slice(0, i);
    comparison = strs.every(
      (str) => {
        var a = str.slice(0, i)
        return a === compareStr
      }
    )
    if (comparison) {
      return compareStr
    }
  }
  return ""
}

var strs = ["flower","flow","flight"]
console.log(longestCommonPrefix(strs))

var strs = ["dog", "racecar", "car"]
console.log(longestCommonPrefix(strs))