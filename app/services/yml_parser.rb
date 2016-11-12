class YmlParser

  def initialize
    @file_name = 'config/game_config.yml'
    @log = Logger.new('log/yml_parser.log')

    if File.exist?(@file_name) 
      @data = YAML.load_file(@file_name)
    else
      @log.error('Config file not found!')
    end
  end

  def products
    @data['products'] ? @data['products'] : @log.error('Products record not found in config!')
  end

  def stock_volume
    @data['stock_volume'] ? @data['stock_volume'] : @log.error('Stock Volume record not found in config!')
  end
end