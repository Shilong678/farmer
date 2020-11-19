function create() {
    const newData = $('#createUrl').val();
    if (validUrl(newData)) {
        const myData = {
            url: newData
        };
        const urlData = JSON.stringify(myData);
        $('#createButton').attr("disabled", true);
        $('#createUrl').val('');
        $.ajax('http://localhost:4000/', {
            type: 'POST',
            data: urlData,
            success: function (data, status, xhr) {
                $('#createResult').show().append('Your shortened url is :' + 'https:/' + data['short_url']);
                console.log(data);
            },
            error: function (jqXhr, textStatus, errorMessage) {
                $('#createResult').show().append('Error' + errorMessage);
            }
        });
    }

}

function search() {
    $('#searchButton').attr("disabled", true);
    const newData = $('#searchUrl').val();
    $('#searchUrl').val('');
    $.ajax(`http://localhost:4000/${newData}?reqtype=frontend`, {
        type: 'GET',
        dataType: 'json',
        success: function (data, status, xhr) {
            $('#searchResult').show().append('Your url is :' + data);
            console.log(data);

        },
        error: function (jqXhr, textStatus, errorMessage) {
            $('#searchResult').show().append('Error' + errorMessage);

        }
    });
}

function closeAlert() {
    $('button').attr("disabled", false);
    $('.shortAnswer').hide().empty();

}

function validUrl(myURL) {
    var pattern = new RegExp('^(https?:\\/\\/)?' + // protocol
        '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|' + // domain name
        '((\\d{1,3}\\.){3}\\d{1,3}))' + // ip (v4) address
        '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + //port
        '(\\?[;&amp;a-z\\d%_.~+=-]*)?' + // query string
        '(\\#[-a-z\\d_]*)?$', 'i');
    return pattern.test(myURL);
}