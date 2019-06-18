class CleanerService

  def clean(item)
    cleaned_item = item.gsub(/[{}]/, '') if item
  end

  def self.snake_case(item)
    item.split(' ').map {|word| word.downcase + '_'}.join.chomp('_')
  end
end
