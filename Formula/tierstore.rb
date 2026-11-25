class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.182/tierstore-0.3.182-macos-arm64.tar.gz"
      sha256 "84d21bd4f0a97164115d023798f574bab9853f3dcfd93e62da9fa417c445aeb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.182/tierstore-0.3.182-linux-aarch64.tar.gz"
      sha256 "e3860a08e68ac25189d88de57912b73c09da654f4db46170e1d4249ed44cff55"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.182/tierstore-0.3.182-linux-x86_64.tar.gz"
      sha256 "148ff1df366418ec7dd5bbae9ab17ade003e8f33aacc71f191018d84078f3223"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
