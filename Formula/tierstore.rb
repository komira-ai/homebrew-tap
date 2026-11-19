class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.138/tierstore-0.3.138-macos-arm64.tar.gz"
      sha256 "9293fd4126d6f7146c855b7964758fdf79500fb841e10be2f54c568048026d92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.138/tierstore-0.3.138-linux-aarch64.tar.gz"
      sha256 "ceef068d81d576069bf96d5d18b34df3095924506ba8f45e29b98886290c60b7"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.138/tierstore-0.3.138-linux-x86_64.tar.gz"
      sha256 "2ee11e66cbadf13ffcc38fc9ac9f4b7b5f9aeb4a3136e67fbbdfd5b550fd3d25"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
