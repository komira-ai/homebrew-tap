class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.178/tierstore-0.3.178-macos-arm64.tar.gz"
      sha256 "0c4e281d5dc3e2c19c92b20dfe1d5ad635f1fe9815b507110de55cd4efb59614"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.178/tierstore-0.3.178-linux-aarch64.tar.gz"
      sha256 "4a4a3bbdbad2be6fa1de6497313057ac86071367176b7c7545917f3484596fa1"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.178/tierstore-0.3.178-linux-x86_64.tar.gz"
      sha256 "7e185ee3e44e646a694221fbc62e6e3e6915dec58f3f3864bef04455a8459dd0"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
