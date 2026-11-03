class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.74/buildrules-cli-0.0.74-macos-arm64.tar.gz"
      sha256 "00d58e48f2b82e0bb7f4ffaa4748ea32abee5c54927eefed717868a4aa1a2afa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.74/buildrules-cli-0.0.74-linux-aarch64.tar.gz"
      sha256 "7dd4efc23939bd6b949f5ad892abda7057f65d843b4c452350479988eb6d04a9"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.74/buildrules-cli-0.0.74-linux-x86_64.tar.gz"
      sha256 "34ddcd4daa5a1b307d9f92ba23e73326ebd4fbbb3452232b16618899aba68bde"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
