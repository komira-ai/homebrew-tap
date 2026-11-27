class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.202/tierstore-0.3.202-macos-arm64.tar.gz"
      sha256 "ad51bd6be4fc886640c00c8f17d9b7a4851db926e8fca67553e6d8a1028e7ed5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.202/tierstore-0.3.202-linux-aarch64.tar.gz"
      sha256 "847124578305cf0372edcf1c2c7e75a5e6862e75aaf6cb1fb56081f370a92a3c"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.202/tierstore-0.3.202-linux-x86_64.tar.gz"
      sha256 "4932c5d3d4d280806d8a806990c40d94d158308a14f1e659754eb20641ef9489"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
