class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.147/mopm-0.0.147-macos-arm64.tar.gz"
      sha256 "24d1a13054432fc57c3a0bcd65068af69bf9b5dd5123a5e05d56520e7859633c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.147/mopm-0.0.147-linux-aarch64.tar.gz"
      sha256 "96add1e5c132e937b14d667f8ab36070fa511ae13338f5733fe0686b51cdab29"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.147/mopm-0.0.147-linux-x86_64.tar.gz"
      sha256 "07b74d2b54d090445e42d3653db13390ae0471687d88428bb29b76a11bf217c8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
