$('.blog_publish').on('change', function() {
    jQuery.ajax({  
        url: "blogs/change_status/" + $(this).parents('tr').find('.blog_id').val(),  
        type: 'PUT',
        data: {blog: {publish: $(this).val()}},
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},

        success: function(data) {
            alert('Status Changed successfully')
            location.reload() 
        }
    });
})