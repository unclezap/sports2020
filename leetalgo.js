let array = [100, 40, 17, 9, 73, 75]
let k = 3


var maxScore = function(cardPoints, d) {
    let initialScore = cardPoints.shift() + cardPoints.pop()
    let front = initialScore;
    let back = initialScore;
    let revArr = cardPoints.reverse();
    for (e=0;e<d-2;e++) {
        front += cardPoints[e];
        back += revArr[e];
    };
    return front>back ? front : back
};

var joeScore = function(cPoints, f) {
    let fro = 0;
    let bac = 0;
    let reverseArr = cPoints.reverse();
    for (i=0;i<=f-1;i++) {
        fro += cPoints[i];
        bac += reverseArr[i];
    };
    if (fro > bac) {
      return fro;
    } else {
      return bac;
    }
};

function cardPicker (cards, picks) {
    let highScore = 0
    for (a=0; a < picks; a++) {
        score = 0
        b = 0
        while (b < a) {
            score += cards[b]
            b++
        }
        c=0
        while (c > (picks - a) * -1) {
            score += cards[cards.length + c - 1]
            c--
        }

        if (score > highScore) {
            highScore = score
        }
    }
      return highScore
}


// console.log(cardPicker(array, k))
// console.log(maxScore(array,k))
// console.log(joeScore(array,k))
// console.log(array[0])


s = Date.now()
for(r=0; r<1000000;r++) {
  cardPicker(array,k)
}
q = Date.now()
tiElapsed = q - s

console.log(`zeb time: ${tiElapsed} ms`)

  start = Date.now()
  for(t=0; t<1000000;t++) {
    maxScore(array,k)
  }
  end = Date.now()
  timeElapsed = end - start
  
  console.log(`jonny time: ${timeElapsed} ms`)

  z = Date.now()
  for(y=0; y<1000000;y++) {
    joeScore(array,k)
  }
  x = Date.now()
  tElapsed = x - z
  
  console.log(`joe time: ${tElapsed} ms`)
