class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.80/tierstore-0.3.80-macos-arm64.tar.gz"
      sha256 "42c23baca2d34918bff2f8c10beadae6b3c06952bd94884d901c4bfde31dcd8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.80/tierstore-0.3.80-linux-aarch64.tar.gz"
      sha256 "c1d5e011bfdcc5964c0c7c607210c14b4b0f8b40575f760a698140d847970d7f"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.80/tierstore-0.3.80-linux-x86_64.tar.gz"
      sha256 "7a1bf9b14f66249bd5121505ba6cfa6c896ea258421679b01470f10d95d15615"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
