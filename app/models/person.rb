class Person < Struct.new(:name, :email, :bio, :image_filename, :url, :role)
  include Draper::Decoratable

  def self.directors
    all.select { |p| p.director? }
  end

  def self.staff
    all.select { |p| p.staff? }
  end

  def director?
    role == :director
  end

  def staff?
    role == :staff
  end

  private

  def self.all
    [
      [
        "Leni Mayo",
        "",
        "Leni is a software engineer, angel investor and chairman of Startup Victoria.",
        "Leni-Mayo.png",
        "http://moniker.net/leni/bio/",
        :director
      ],
      [
        "Michelle Bourke",
        "",
        "Michelle is the director of Artlivemedia and co-director of The Talent Door.",
        "Michelle-Bourke.png",
        "http://au.linkedin.com/in/michellebourke/",
        :director
      ],
      [
        "Scott Handsaker",
        "",
        "Scott is the CEO of Attendly and Eventarc and a mentor at AngelCube.",
        "Scott-Handsaker.png",
        "http://au.linkedin.com/in/scotthandsaker/",
        :director
      ],
      [
        "Miguel Wood",
        "",
        "Miguel is Co-founder and CEO of Euler's Bridge and Co-founder of Tin Alley beta.",
        "Miguel-Wood.png",
        "http://au.linkedin.com/in/migster/",
        :director
      ],
      [
        "Scott Handsaker",
        "scott.handsaker@startupvictoria.com.au",
        "Interim Chief Executive Officer",
        "Scott-Handsaker.png",
        "http://au.linkedin.com/in/scotthandsaker/",
        :staff
      ],
      [
        "Thomas Anbeek",
        "thomas@startupvictoria.com.au",
        "Events Manager",
        "Thomas-Anbeek.png",
        "http://au.linkedin.com/pub/thomas-anbeek/66/799/263/",
        :staff
      ],
      [
        "Jay Lynch",
        "jay@startupvictoria.com.au",
        "Chief Technology Officer",
        "Jay-Lynch.png",
        "https://www.linkedin.com/in/lynchjay/",
        :staff
      ],
    ].map do |a|
      new *a
    end
  end
end
