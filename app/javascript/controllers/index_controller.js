import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.searchField = document.getElementById('search_field');
    }

    search(event) {
        const value = event.currentTarget.dataset.value;
        let current = this.searchField.value;
        if (current === '') {
            this.searchField.value = value;
        } else {
            if (!current.includes(value)) {
                this.searchField.value = current + ', ' + value;
            }
        }
    }
}