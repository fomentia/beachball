class Beachball
  def initialize(fps)
    @delay = 1.0/fps.to_f
    @frames = %w{ | / - \\ }
    @iter = 0
  end

  def start
    @beachball = Thread.new do
      while @iter do
        print @frames[(@iter+=1) % @frames.length]
        sleep @delay
        print "\b"
      end
    end
  end

  def stop
    @iter = false
    @beachball.join
  end
end
