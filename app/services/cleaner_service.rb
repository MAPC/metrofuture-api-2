class CleanerService

  def clean(item)
    cleaned_item = item.gsub(/[{}]/, '') if item
  end

  def snake_case(item)
    if item
      item.gsub('&', '')
      item.split(' ').map { |word| word.downcase + '_'}.join.chomp('_')
    end
  end
end
