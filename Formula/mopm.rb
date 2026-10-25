class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.51/mopm-0.0.51-macos-arm64.tar.gz"
      sha256 "e3340410dea7f07ffde35107530d554c94f1ec3fbcaae675f5fc2fee9e66d96f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.51/mopm-0.0.51-linux-aarch64.tar.gz"
      sha256 "8c5191fd1013fdb2159105ca8e053430b9d1b268cc13e12af731b8a083703416"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.51/mopm-0.0.51-linux-x86_64.tar.gz"
      sha256 "14179da98ebd30eb32d6ffdab688425d245bcc4669867379e377d2b7e2d35de6"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
