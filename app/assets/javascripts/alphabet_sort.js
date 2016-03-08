var alphabetSort = function () {
    var links = $('#links');
    var link = links.children('li').get();
    link.sort(function(a, b) {
        return $(a).text().toUpperCase().localeCompare($(b).text().toUpperCase());
    });
    $.each(link, function(index, item) { links.append(item); });
};
