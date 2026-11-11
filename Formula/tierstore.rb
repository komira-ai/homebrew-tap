class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.95/tierstore-0.3.95-macos-arm64.tar.gz"
      sha256 "a02cd68b37d12c0061ab4c4e683b1653c6578e299eb1ccbf1c1f419787c18d17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.95/tierstore-0.3.95-linux-aarch64.tar.gz"
      sha256 "21918d3d9ffccba7349e143540385c45ed42f73d4ffbd6b341ff6a1ad33c9b30"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.95/tierstore-0.3.95-linux-x86_64.tar.gz"
      sha256 "424432ba039698ae754458c35fb4595a3e18a17fec38eefdfd471c5d21b06900"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
