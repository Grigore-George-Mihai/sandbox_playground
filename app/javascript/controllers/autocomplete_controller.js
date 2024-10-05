import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["input", "results"];

	connect() {
		this.hideResults();
	}

	search() {
		const query = this.inputTarget.value;

		if (query.length < 3) {
			this.hideResults();
			return;
		}

		fetch(`/posts/autocomplete?query=${query}`, {
			headers: { Accept: "application/json" },
		})
			.then((response) => response.json())
			.then((data) => {
				this.resultsTarget.innerHTML = "";
				data.forEach((result) => {
					const item = document.createElement("div");
					item.classList.add("autocomplete-item");
					item.textContent = result;
					item.addEventListener("click", () => {
						this.inputTarget.value = result;
						this.hideResults();
					});
					this.resultsTarget.appendChild(item);
				});
				this.resultsTarget.style.display = "block";
			});
	}

	submitOnEnter(event) {
		if (event.key === "Enter") {
			this.element.submit();
		}
	}

	hideResults() {
		this.resultsTarget.style.display = "none";
	}
}