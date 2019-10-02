function groups_for(account) {
    $.ajax({
        url: 'categories/account_groups',
        data: {
            account_id: account.selectedOptions[0].value
        }
    });
}