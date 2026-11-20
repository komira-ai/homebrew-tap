class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.149/tierstore-0.3.149-macos-arm64.tar.gz"
      sha256 "39ab5e629c19ecbc0194d705eab60604743039c47c37d2938f76499fbda8cb76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.149/tierstore-0.3.149-linux-aarch64.tar.gz"
      sha256 "9a48cfcd0a71e89910d1c6c102203166dc6f1b561762fe7bdd9c1f8ba4e37e10"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.149/tierstore-0.3.149-linux-x86_64.tar.gz"
      sha256 "e922888d4b956b99c787faacd2a79c01519818695e56f74fd4658bea0216d3a9"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
