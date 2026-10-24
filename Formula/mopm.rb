class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.36/mopm-0.0.36-macos-arm64.tar.gz"
      sha256 "220fe4efc290fd09cf6f6af3e9075b9876e5fb5495bea123316614cd4ea9e143"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.36/mopm-0.0.36-linux-aarch64.tar.gz"
      sha256 "383fa62163c954246f1bf01fe10384dfe662e07431215f10935fc8ed0489202d"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.36/mopm-0.0.36-linux-x86_64.tar.gz"
      sha256 "cab28cf42f1fc8d0ff4d5fd41f68dfc8c30321443bce1766536150b8029d04fe"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
