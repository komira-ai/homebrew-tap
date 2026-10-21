class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  version "0.0.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.11/mopm-0.0.11-macos-arm64.tar.gz"
      sha256 "e742055e2689d4e16896dd15804809d86d78b39fe92c541c79accf4266bab53e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.11/mopm-0.0.11-linux-aarch64.tar.gz"
      sha256 "9a8c1bf00c1b746a579dfe7e062311c639ced910d3b8a280e10176df24e8c63c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.11/mopm-0.0.11-linux-x86_64.tar.gz"
      sha256 "76951bf43314fcccd13d603e1cee5e49854d8a7c11af44594afe7c5c4461a920"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
