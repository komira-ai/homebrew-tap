class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.98/mopm-0.0.98-macos-arm64.tar.gz"
      sha256 "290ee53c92339c90b9511f2e082daf430c770035d8b73a25259492caf4af2f43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.98/mopm-0.0.98-linux-aarch64.tar.gz"
      sha256 "0c444d4087be6e8d3eaf72fd51f36bdec3354da527d4161c0d22965157c17443"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.98/mopm-0.0.98-linux-x86_64.tar.gz"
      sha256 "edc6ff760d8c5c24f81dca48af39f041280a1d76202da836d625e6ea7e5693e8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
