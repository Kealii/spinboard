var fetchLinks = function(url) {
    $.get(url, function (data) {
        data.forEach(function (link) {
            var title, url, buttonText, form, editLink, csrf, li, recommend;
            csrf = $("meta[name=csrf-token]").attr("content");
            li = $("<li></li>");

            if (link.read) {
                title = $("<h4><s>" + link.title + "</s><h4>");
                url   = $("<h5><s>" + link.url   + "</s></h5>");
                buttonText = "Mark as Unread"
            } else {
                title = $("<h4>" + link.title + "<h4>");
                url   = $("<h5>" + link.url   + "</h5>");
                buttonText = "Mark as Read"
            }

            form = '<form class="button_to" method="post" action="/links/' + link.id + '/change_status">' +
                '<input type="submit" class="btn btn-success" value="' + buttonText + '">' +
                '<input type="hidden" name="authenticity_token" value="' + csrf + '">' +
                '</form>';
            form = '<form class="button_to" method="post" action="/links/' + link.id + '/change_status">' +
                '<input type="submit" class="btn btn-success" value="' + buttonText + '">' +
                '<input type="hidden" name="authenticity_token" value="' + csrf + '">' +
                '</form>';

            editLink = $('<a class="btn btn-info" href="/links/' + link.id + '/edit">Edit</a>');
            recommend = $('<a class="btn btn-warning" href="/links/' + link.id + '/recommend">Recommend</a>');
            li.append(title).append(url).append(editLink).append(form).append(recommend);
            $('ul').append(li);
        })
    })
};