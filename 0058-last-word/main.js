var lengthOfLastWord = function(s) {
  const words = s.split(/\W/);
  const nonEmptyWords = words.filter((w) => { return w.length > 0 });
  const lastWord = nonEmptyWords[nonEmptyWords.length - 1];
  const wordLength = lastWord.length;
  return wordLength;
};


// e1 = "Hello World";
// console.log(lengthOfLastWord(e1));

e2 = "   fly me   to   the moon  ";
console.log(lengthOfLastWord(e2));

// e3 = "luffy is still joyboy";
// console.log(lengthOfLastWord(e3));