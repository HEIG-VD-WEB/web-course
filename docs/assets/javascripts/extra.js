document.querySelectorAll("code").forEach((block) => {
	block.addEventListener("dblclick", (e) => {
		e.preventDefault();
		const code = block.textContent;

		console.log("🚀 Evaluating code:");
		console.log(code);
		try {
			eval(code);
		} catch (err) {
			console.error(err);
		} finally {
			console.log("✅ Done");
		}
	});
});
