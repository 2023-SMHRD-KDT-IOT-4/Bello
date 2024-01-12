
  const deliveryOption = document.getElementById('delivery_option');
  const customMessageLabel = document.getElementById('custom_message_label');
  const customMessageTextarea = document.getElementById('custom_message');

  deliveryOption.addEventListener('change', function() {
    if (this.value === 'custom_message') {
      customMessageLabel.style.display = 'block';
      customMessageTextarea.setAttribute('required', 'true');
    } else {
      customMessageLabel.style.display = 'none';
      customMessageTextarea.removeAttribute('required');
    }
  });
