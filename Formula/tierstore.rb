class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.160/tierstore-0.3.160-macos-arm64.tar.gz"
      sha256 "ce38c8cf6262fe28778d3501575615ef849b8dae842a23f56e52013b76468b20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.160/tierstore-0.3.160-linux-aarch64.tar.gz"
      sha256 "351a2a1d3dfd5d4a5181f23888fddfd2bc208d1776e0c0bf7c11924834e3456a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.160/tierstore-0.3.160-linux-x86_64.tar.gz"
      sha256 "e0983b08e8d9449518f2ae332db491fb152342c97ff6835af6a2057e55d7fedd"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
