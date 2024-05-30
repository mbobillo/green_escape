import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropzone"
export default class extends Controller {
  static targets = ["fileInput", "preview"]

  connect() {
    this.element.addEventListener('dragover', this.onDragOver.bind(this));
    this.element.addEventListener('dragleave', this.onDragLeave.bind(this));
    this.element.addEventListener('drop', this.onDrop.bind(this));
    this.element.addEventListener('click', this.onClick.bind(this));
  }

  onDragOver(event) {
    event.preventDefault();
    this.element.classList.add('drag-over');
  }

  onDragLeave(event) {
    this.element.classList.remove('drag-over');
  }

  onDrop(event) {
    event.preventDefault();
    this.element.classList.remove('drag-over');

    const files = event.dataTransfer.files;
    this.handleFiles(files);
  }

  onClick() {
    this.fileInputTarget.click();
  }

  handleFiles(files) {
    const fileList = Array.from(files);
    fileList.forEach(file => {
      this.previewFile(file);
    });
    this.fileInputTarget.files = files;
  }

  previewFile(file) {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onloadend = () => {
      const img = document.createElement('img');
      img.src = reader.result;
      img.classList.add('preview-image');
      this.previewTarget.appendChild(img);
    };
  }
}
