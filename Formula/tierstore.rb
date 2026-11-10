class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.83/tierstore-0.3.83-macos-arm64.tar.gz"
      sha256 "1e17cf9b7263eae4dd245f694d3a52e9f57134450771a68851b86de523846aeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.83/tierstore-0.3.83-linux-aarch64.tar.gz"
      sha256 "66b22f8ddb8e732ddfa46b20e28d01d92345f9af65ef56530c04ae7f102ab226"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.83/tierstore-0.3.83-linux-x86_64.tar.gz"
      sha256 "96cbba6823ee567a1620e9244ebd54549176d741eaeca9df849fdf6e9bb28b70"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
