Before do
  @rest = Rest.new
  page.current_window.resize_to(1920, 1080)
end

After do
  shot = page.save_screenshot('logs/temp_evidence.png')

  Allure.add_attachment(
    name: 'Screenshot',
    type: Allure::ContentType::PNG,
    source: File.open(shot)
  )
end
