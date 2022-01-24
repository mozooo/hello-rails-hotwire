import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'row' ];
  static classes = [ 'selected' ];

  // コントローラがDOMと接続された時に実行されるハンドラー
  connect() {
    this.clearState();
  }

  // すべての行を未選択状態にする(selectedクラスを取り除く)
  clearState() {
    this.rowTargets.forEach((tableRow) => {
      tableRow.classList.remove(this.selectedClass);
    });
  }

  // クリックされた行を選択状態にする
  selectRow(event) {
    this.clearState();
    const tableRow = event.target.closest('tr');
    tableRow.classList.add(this.selectedClass);
  }
}
