document.addEventListener("DOMContentLoaded", function() {
    const filterItems = document.querySelectorAll(".filter-item");

    filterItems.forEach(function(item) {
        item.addEventListener("click", function(event) {
            event.preventDefault();
            const filterValue = item.getAttribute("data-filter");
            filterItems.forEach(function(filterItem) {
                filterItem.classList.remove("active");
            });
            item.classList.add("active");
            filterAlbums(filterValue);
        });
    });

    function filterAlbums(filter) {
        const albums = document.querySelectorAll(".single-album-item");
        albums.forEach(function(album) {
            album.style.display = "none";
            if (album.classList.contains(filter) || filter === "*") {
                album.style.display = "block";
            }
        });
    }
});
