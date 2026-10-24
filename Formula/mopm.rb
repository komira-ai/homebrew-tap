class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.40/mopm-0.0.40-macos-arm64.tar.gz"
      sha256 "ccf63ec5d90f0a464a873827fb7db3e776c511dab2443b8b2c5ca7a585fd4967"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.40/mopm-0.0.40-linux-aarch64.tar.gz"
      sha256 "8892c53d2fe86a12450cf5b648021395b36ec8372a30b95713a8a0977ae38c85"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.40/mopm-0.0.40-linux-x86_64.tar.gz"
      sha256 "e527b4afe1f248309f315d37e86a45a97ef04c4eed5ae262c94ddfe0c9885f2c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
