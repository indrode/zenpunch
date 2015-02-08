class Plex
  class << self
    def ip
      File.read(filename)
    end

    def update_ip!(ip)
      File.write(filename, ip)
    end

    private

    def filename
      "#{Rails.root}/../../shared/ip.txt"
    end
  end
end
