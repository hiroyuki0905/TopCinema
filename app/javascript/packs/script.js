const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

class Car {
  constructor(x, y, speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.width = 190;
    this.height = 60;
  }

  draw() {
    ctx.fillStyle = "gray"; // 車の色を指定（灰色）
    ctx.beginPath(); // 新しいパスを開始
    ctx.moveTo(this.x - 50, this.y + this.height - 70); // パスの開始位置を指定（左下）
    ctx.lineTo(this.x + this.width - 50, this.y + this.height - 70); // パスを引いて線を描画（下辺）
    ctx.lineTo(this.x + this.width, this.y + this.height - 70); // パスを引いて線を描画（右上）
    ctx.lineTo(this.x + this.width, this.y - 35); // パスを引いて線を描画（右下）
    ctx.lineTo(this.x + this.width - 200, this.y - 100); // パスを引いて線を描画（斜め上左）
    ctx.lineTo(this.x + 10, this.y - 70); // パスを引いて線を描画（上辺）
    ctx.closePath(); // パスを閉じる
    ctx.fill(); // パス内を塗りつぶす

    ctx.fillStyle = "black"; // タイヤの色を指定（黒色）

    // タイヤ1
    ctx.beginPath(); // 新しいパスを開始
    ctx.arc(this.x + 5, this.y - 20, 15, 0, Math.PI * 2); // 円を描画（タイヤ1）
    ctx.closePath(); // パスを閉じる
    ctx.fill(); // パス内を塗りつぶす

    // タイヤ2
    ctx.beginPath(); // 新しいパスを開始
    ctx.arc(this.x + this.width - 40, this.y - 20, 15, 0, Math.PI * 2); // 円を描画（タイヤ2）
    ctx.closePath(); // パスを閉じる
    ctx.fill(); // パス内を塗りつぶす

    // 窓を描画（黒色）
    ctx.fillStyle = "black";
    ctx.fillRect(this.x + 20, this.y - 61, this.width - 100, 15); // 窓の位置とサイズを指定
  }

  update() {
    this.x += this.speed;
    if (this.x > canvas.width) {
      this.x = -this.width;
    }
  }
}

const car = new Car(-150, canvas.height - 230, 5); // スピード調整

function animate() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  car.draw();
  car.update();

  requestAnimationFrame(animate);
}

animate();
