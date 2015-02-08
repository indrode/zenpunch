class Plex
  class << self
    def ip
      ip = File.read(filename)
    end

    def update_ip!(ip)
      File.write(filename, ip)
      true
    end

    private

    def filename
      "#{Rails.root}/../../shared/ip.txt"
    end
  end
end
