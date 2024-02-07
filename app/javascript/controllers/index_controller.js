import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.selectedTags = document.getElementById('tags_field');
    }

    setTags(event) {
        const value = event.currentTarget.dataset.value;
        let current = this.selectedTags.value;
        if (current === '') {
            this.selectedTags.value = value;
        } else {
            if (!current.includes(value)) {
                this.selectedTags.value = current + ', ' + value;
            }
        }
    }
}