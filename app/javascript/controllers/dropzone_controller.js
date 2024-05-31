import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="dropzone"
// export default class extends Controller {
//   static targets = ["fileInput", "preview"]

//   connect() {
//     this.element.addEventListener('dragover', this.onDragOver.bind(this));
//     this.element.addEventListener('dragleave', this.onDragLeave.bind(this));
//     this.element.addEventListener('drop', this.onDrop.bind(this));
//     this.element.addEventListener('click', this.onClick.bind(this));
//   }

//   onDragOver(event) {
//     event.preventDefault();
//     this.element.classList.add('drag-over');
//   }

//   onDragLeave(event) {
//     this.element.classList.remove('drag-over');
//   }

//   onDrop(event) {
//     event.preventDefault();
//     this.element.classList.remove('drag-over');

//     const files = event.dataTransfer.files;
//     this.handleFiles(files);
//   }

//   onClick() {
//     this.fileInputTarget.click();
//   }

//   handleFiles(files) {
//     const fileList = Array.from(files);
//     fileList.forEach(file => {
//       this.previewFile(file);
//     });
//     this.fileInputTarget.files = files;
//   }

//   previewFile(file) {
//     const reader = new FileReader();
//     reader.readAsDataURL(file);
//     reader.onloadend = () => {
//       const img = document.createElement('img');
//       img.src = reader.result;
//       img.classList.add('preview-image');
//       this.previewTarget.appendChild(img);
//     };
//   }
// }


export default class extends Controller {
  static targets = ["dropZone", "fileInput", "preview"]

  connect() {
    this.dropZoneTarget.addEventListener('dragover', this.onDragOver.bind(this));
    this.dropZoneTarget.addEventListener('dragleave', this.onDragLeave.bind(this));
    this.dropZoneTarget.addEventListener('drop', this.onDrop.bind(this));
    this.dropZoneTarget.addEventListener('click', this.onClick.bind(this));
  }

  onDragOver(event) {
    event.preventDefault();
    this.dropZoneTarget.classList.add('drag-over');
  }

  onDragLeave(event) {
    this.dropZoneTarget.classList.remove('drag-over');
  }

  onDrop(event) {
    event.preventDefault();
    this.dropZoneTarget.classList.remove('drag-over');

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

    const dataTransfer = new DataTransfer();
    Array.from(this.fileInputTarget.files).forEach(file => dataTransfer.items.add(file));
    fileList.forEach(file => dataTransfer.items.add(file));
    this.fileInputTarget.files = dataTransfer.files;
  }

  previewFile(file) {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onloadend = () => {
      const div = document.createElement('div');
      div.classList.add('preview-item');

      const img = document.createElement('img');
      img.src = reader.result;
      img.classList.add('preview-image');

      const button = document.createElement('button');
      button.textContent = 'Delete';
      button.type = 'button';
      button.classList.add('delete-button');
      button.addEventListener('click', () => this.removeFile(file, div));

      div.appendChild(img);
      div.appendChild(button);
      this.previewTarget.appendChild(div);
    };
  }

  removeFile(file, previewElement) {
    previewElement.remove();

    const dataTransfer = new DataTransfer();
    Array.from(this.fileInputTarget.files).forEach(existingFile => {
      if (existingFile !== file) {
        dataTransfer.items.add(existingFile);
      }
    });
    this.fileInputTarget.files = dataTransfer.files;
  }
}
