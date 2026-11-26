class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.187/tierstore-0.3.187-macos-arm64.tar.gz"
      sha256 "073647b0b2ea0138acedb05c7f1fded27fc8e1f72fc8714aaf0e3e7c6cf2ae4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.187/tierstore-0.3.187-linux-aarch64.tar.gz"
      sha256 "833a0f60e1921d0c3f1a8a8f05ddf833fcf0d760b46887885cf0c194f6eb406a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.187/tierstore-0.3.187-linux-x86_64.tar.gz"
      sha256 "4461fb581c7ff13be4f3c49c5cbbc81723538251726a7d7032880c21d8c909c8"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
